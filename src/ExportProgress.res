@module("./styles/ExportProgress.module.scss") external styles: {..} = "default"

let toPercent = progress => (progress *. 100.0)->Belt.Float.toInt

@react.component
let make = Mobx.observer(() => {
  open Store.Progress
  let state = store->Mobx.Box.get

  React.useEffect1(() => {
    switch state {
    | Store.Progress.Failure(_) | Store.Progress.Success =>
      Some(Window.createTimeout(() => Idle->set, 800))
    | _ => None
    }
  }, [state])

  <div className={CX.cx([styles["base"], state === Idle ? None : styles["base_active"]])}>
    <div className={styles["progress"]}>
      {switch state {
      | Idle => React.null
      | Store.Progress.Failure(progress) =>
        <RSuite.Progress.Circle percent={progress->toPercent} status={#fail} />
      | Store.Progress.Success => <RSuite.Progress.Circle percent={100} status={#success} />
      | Progress(progress) =>
        <RSuite.Progress.Circle percent={progress->toPercent} status={#active} />
      }}
    </div>
  </div>
})
