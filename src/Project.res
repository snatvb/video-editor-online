@module("./styles/Project.module.scss") external styles: {..} = "default"

@react.component
let make = () => {
  <div className={styles["base"]}>
    <div className={styles["files"]}> <Files /> </div>
    <div className={styles["video"]}> <Video /> </div>
  </div>
}
