let make = () => {
  open Promise
  let {start, end, currentTime, forSetCurrentTime, fileId} = Store.Timeline.store
  let Some(id) = fileId
  switch Store.Files.store.items->Map.get(id) {
  | Some(file) => {
      let ff = FFMpeg.deafultOptions->FFMpeg.create
      ff
      ->FFMpeg.load
      ->then(() => FFMpeg.fetchFile(file))
      ->then(fetechedFile => FFMpeg.fs(ff, #writeFile, file.name, fetechedFile))
      ->then(() => FFMpeg.run(ff, "-i", file.name, "output.mp4"))
      ->thenResolve(() => {
          let data = FFMpeg.readData(ff, "output.mp4")->File.getBufffer
          let blob = File.Blob.makeVideo([data])
          File.Blob.saveAs(blob, file.name)
          Js.log(data)
      })
      ->ignore
    }
  | None => Js.log("Ooops...")
  }
}
