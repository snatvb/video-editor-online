@module("./styles/Video.module.scss") external styles: {..} = "default"

type props
@obj external makeProps: unit => props = ""

let make = React.memo(
  Mobx.observer((_: props) => {
    let fileSrc = Store.Timeline.curretFileSrc->Mobx.readComputed
    let videoRef = React.useRef(Js.Nullable.null)

    let handleTimeUpdate = event => {
      let target = ReactEvent.Media.target(event)
      (target["currentTime"] /. target["duration"])->Store.Timeline.setCurrentTime
    }

    React.useEffect0(() => {
      let setCurrentTime = newTime =>
        videoRef.current
        ->Js.Nullable.toOption
        ->Belt.Option.map(video => video->DOM.Video.setCurrentTime(newTime *. video->DOM.Video.getDuration))
      Some(Mobx.autorun(() => setCurrentTime(Store.Timeline.store.forSetCurrentTime)->ignore))
    })

    <div className={styles["base"]}>
      {switch fileSrc {
      | None => <div> {React.string("Select file")} </div>
      | Some(src) =>
        <div className={styles["video-container"]}>
          <video
            src
            className={styles["video"]}
            onTimeUpdate={handleTimeUpdate}
            controls={true}
            ref={videoRef->ReactDOM.Ref.domRef}
          />
        </div>
      }}
    </div>
  }),
)
