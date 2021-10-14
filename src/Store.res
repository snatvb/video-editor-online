module Select = {
  type file
  let file: Effector.store<Js.Null.t<file>> = Effector.createStore(Js.null)
  let update: Effector.event<file> = Effector.createEvent()
  let clear: Effector.event<unit> = Effector.createEvent()

  file->Effector.on(update, (_, path) => path)->Effector.reset(clear)->ignore

  let upload: Effector.Effect.t<file, Promise.t<string>> = Effector.Effect.create(file => {
    Js.log(file)
    Promise.resolve("test")
  })

  type error
  type uploadEffect = {
    loading: Effector.store<bool>,
    error: Effector.store<error>,
    data: Effector.store<Promise.t<string>>,
  }

  let testEffect = Effector.restore({
    loading: Effector.Effect.pending(upload),
    data: Effector.Effect.doneData(upload),
    error: Effector.Effect.failData(upload),
  })->Effector.combine
}
