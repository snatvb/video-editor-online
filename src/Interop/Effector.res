type store<'a>
type event<'a> = 'a => unit

@module("effector") external createStore: 'a => store<'a> = "createStore"
@module("effector") external createEvent: unit => event<'a> = "createEvent"
@module("effector") external combine: 'a => store<'a> = "combine"
@module("effector") external restore: 'a => store<'a> = "restore"
@module("effector") external createEffect: ('a => 'b) => event<'b> = "createEffect"
@module("effector-react") external useStore: store<'a> => 'a = "useStore"

@send external map: (store<'a>, 'a => 'b) => store<'b> = "map"
@send external on: (store<'a>, event<'e>, ('a, 'e) => 'b) => store<'b> = "on"
@send external watch: (store<'a>, event<'e>, ('a, 'e) => 'b) => store<'a> = "watch"
@send external reset: (store<'a>, event<'e>) => store<'b> = "reset"

module Effect = {
  type t<'a, 'b> = 'a => 'b

  @module("effector") external create: ('a => 'b) => t<'a, 'b> = "createEffect"
  @send external watch: (t<'a, 'b>, 'a) => unit = "watch"
  @get external pending: t<'a, 'b> => store<bool> = "pending"
  @get external doneData: t<'a, 'b> => store<'b> = "doneData"
  @get external failData: t<'a, 'b> => store<'e> = "failData"
}
