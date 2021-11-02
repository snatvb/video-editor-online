type computed<'a>
type change<'a>
type disposer = unit => unit

@module("mobx") @val external action: 't => 't = "action"
@module("mobx") @val external observable: 't => 't = "observable"
@module("mobx") @val external autorun: (unit => unit) => disposer = "autorun"
@module("mobx") @val external computed: (unit => 't) => computed<'t> = "computed"
@send external get: 't => 't = "get"
@send external readComputed: computed<'a> => 'a = "get"
@get external getNewValue: change<'a> => 'a = "newValue"


@module("mobx-react") @val external observer: 'a => 'a = "observer"

module Box = {
    type t<'a>
    @module("mobx") @val @scope("observable") external make: 'a => t<'a> = "box"
    @send external get: t<'a> => 'a = "get"
    @send external set: (t<'a>, 'a) => t<'a> = "set"
}
