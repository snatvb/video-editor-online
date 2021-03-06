@module("./styles/Video.module.scss") external styles: {..} = "default"

module NonSelected = {
  @react.component
  let make = () => {
    let locale = LocaleContext.useLocale()
    locale->LocaleContext.getAsReactStr(["video", "non-selected"])
  }
}

type props
@obj external makeProps: unit => props = ""

let make = Mobx.observer((_: props) => {
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
      ->Belt.Option.map(video =>
        video->DOM.Video.setCurrentTime(newTime *. video->DOM.Video.getDuration)
      )
    Some(Mobx.autorun(() => setCurrentTime(Store.Timeline.store.forSetCurrentTime)->ignore))
  })

  React.useEffect1(() => {
    if Belt.Option.isSome(fileSrc) {
      videoRef.current
      ->Js.Nullable.toOption
      ->Belt.Option.forEach(video => {
        if DOM.Video.getReadyState(video) === HaveEnoughData {
          video->DOM.Video.getDuration->Store.Timeline.setDuration
        } else {
          video->DOM.Video.onLoad(() => video->DOM.Video.getDuration->Store.Timeline.setDuration)
        }
      })
    }
    None
  }, [fileSrc])

  <div className={styles["base"]}>
    {switch fileSrc {
    | None => <NonSelected />
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
})
