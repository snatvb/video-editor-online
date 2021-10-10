@module("./styles/Video.module.scss") external styles: {..} = "default"

@react.component
let make = () => {
  <div className={styles["base"]}>
    <div className={styles["files"]}> {React.string("Video")} </div>
  </div>
}
