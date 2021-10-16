@module("./styles/Files.module.scss") external styles: {..} = "default"

let upload = file => {
  open Promise
  file
  ->FFMpeg.fetchFile
  ->then(data => FFMpeg.fsFF(#writeFile, file.name, data))
  ->then(_ => FFMpeg.ff->FFMpeg.run("-i", file.name, "test.mp4"))
  ->thenResolve(() => Js.log("success"))
  ->ignore
  // await ffmpeg.run('-i', 'test.avi', 'test.mp4');
}

@react.component
let make = Mobx.observer(() => {
  let handleSelectFile = event => {
    let files = ReactEvent.Form.currentTarget(event)["files"]
    let file = files[0]
    // upload(file)
    Js.log(Js.Array.from(files))
    Store.Files.add(Js.Array.from(files))
  }

  React.useEffect1(() => {
    // selectedFile->Belt.Option.forEach(f => Store.Select.upload(f)->ignore)
    None
  }, [])

  <div className={styles["base"]}>
    <div className={styles["title"]}> {React.string(`Files`)} </div>
    <div className={styles["add"]}>
      <input type_="file" onChange={handleSelectFile} multiple={true} accept=".mp4,.avi" />
    </div>
    <div className={styles["list"]}>
      {Store.Files.store.items
      ->Map.entries
      ->Iterable.map(((id, file)) => {
        <div key={id->Belt.Int.toString} className={styles["item"]}>
          <div className={styles["preview"]}>
            <VideoPreview file className={styles["video-preview"]} />
          </div>
          <div className={styles["description"]}>
            <div className={styles["name"]}> {React.string(file.name)} </div>
            <div className={styles["size"]}> {React.string(file->File.getSizeAsString)} </div>
          </div>
        </div>
      })
      ->React.array}
    </div>
  </div>
})
