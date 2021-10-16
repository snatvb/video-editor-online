type file = File.t

module Files = {
  type store = {
    mutable lastId: int,
    mutable items: Map.t<int, file>,
  }

  let store = Mobx.observable({ lastId: 0, items: Map.make(), })

  let getNextId = () => {
    store.lastId = store.lastId + 1
    store.lastId
  }

  let add = (files: array<file>) => {
    Js.Array2.forEach(files, file => store.items->Map.set(getNextId(), file)->ignore)
  }
}
