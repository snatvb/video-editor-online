@module("./styles/Files.module.scss") external styles: {..} = "default"

@react.component
let make = () => {
  let handleSelectFile = event => {
    let files = ReactEvent.Form.currentTarget(event)["files"]
    let file = files[0]
  }

  React.useEffect1(() => {
    // selectedFile->Belt.Option.forEach(f => Store.Select.upload(f)->ignore)
    None
  }, [selectedFile])

  <div className={styles["base"]}>
    <div className={styles["title"]}> {React.string(`Files`)} </div>
    <div className={styles["add"]}>
      <input type_="file" onChange={handleSelectFile} accept=".mp4,.avi" />
    </div>
    <div className={styles["list"]} />
  </div>
}
