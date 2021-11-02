@send external toFixed: (float, int) => string = "toFixed"
@val @scope("Math") external round: float => int = "round"

let toMs = (percent, duration) => `${(duration *. percent *. 1000.0)->round->Belt.Int.toString}ms`

let make = () => {
  open Promise
  let {start, end, fileId, duration} = Store.Timeline.store
  let Some(id) = fileId
  switch Store.Files.store.items->Map.get(id) {
  | Some(file) => {
      let ff = FFMpeg.deafultOptions->FFMpeg.create
      ff
      ->FFMpeg.load
      ->then(() => {
        FFMpeg.onProgress(ff, ({ratio}) => ratio->Store.Progress.Progress->Store.Progress.set)
        FFMpeg.fetchFile(file)
      })
      ->then(fetechedFile => FFMpeg.fs(ff, #writeFile, file.name, fetechedFile))
      ->then(() =>
        FFMpeg.run(
          ff,
          ["-i", file.name, "-ss", toMs(start, duration), "-to", toMs(end, duration), "output.mp4"],
        )
      )
      ->thenResolve(() => {
        let data = FFMpeg.readData(ff, "output.mp4")->File.getBufffer
        let blob = File.Blob.makeVideo([data])
        File.Blob.saveAs(blob, file.name)
        FFMpeg.clear(ff, "output.mp4")
        FFMpeg.clear(ff, file.name)
        Store.Progress.set(Store.Progress.Success)
        Js.log2("Success", data)
      })
      ->ignore
    }
  | None => Js.log("Ooops...")
  }
}
