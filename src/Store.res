type file = File.t

module Files = {
  type store = {
    mutable lastId: int,
    mutable items: Map.t<int, file>,
  }

  let store = Mobx.observable({lastId: 0, items: Map.make()})

  let getNextId = Mobx.action(() => {
    store.lastId = store.lastId + 1
    store.lastId
  })

  let add = Mobx.action((files: array<file>) => {
    Js.Array2.forEach(files, file => store.items->Map.set(getNextId(), file)->ignore)
  })
}

module Timeline = {
  type store = {
    mutable start: float,
    mutable end: float,
    mutable currentTime: float,
    mutable forSetCurrentTime: float,
    mutable fileId: option<int>,
  }

  let initState = {fileId: None, currentTime: 0.0, start: 0.0, end: 1.0, forSetCurrentTime: 0.0}
  let store = Mobx.observable({...initState, currentTime: initState.currentTime})

  let reset = Mobx.action(() => {
    store.fileId = initState.fileId
    store.start = initState.start
    store.currentTime = initState.currentTime
    store.end = initState.end
    store.forSetCurrentTime = initState.forSetCurrentTime
  })

  let setFileId = Mobx.action(fileId => {
    reset()
    store.fileId = fileId
  })

  let setStart = Mobx.action(start => {
    store.start = start
  })

  let setCurrentTime = Mobx.action(currentTime => {
    store.currentTime = currentTime
  })

  let setForSetCurrentTime = Mobx.action(time => {
    store.forSetCurrentTime = time
  })

  let setEnd = Mobx.action(end => {
    store.end = end
  })

  let currentFile = Mobx.computed(() =>
    Belt.Option.flatMap(store.fileId, Files.store.items->Map.get)
  )

  let curretFileSrc = Mobx.computed(() =>
    currentFile->Mobx.readComputed->Belt.Option.map(File.toSrc)
  )
}
