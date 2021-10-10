@module("./styles/Files.module.scss") external styles: {..} = "default"

@react.component
let make = () => {
  <div className={styles["base"]}>
    <div className={styles["title"]}> {React.string("Files")} </div>
    <div className={styles["list"]}> <Antd.Button> {React.string("Add")} </Antd.Button> </div>
  </div>
}
