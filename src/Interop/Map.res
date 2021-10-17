type t<'a, 'b>

@new external make: unit => t<'a, 'b> = "Map"

@send external set: (t<'a, 'b>, 'a, 'b) => t<'a, 'b> = "set"
@send external get: (t<'a, 'b>, 'a) => option<'b> = "get"
@send external has: (t<'a, 'b>, 'a) => bool = "has"
@send external values: t<'a, 'b> => Iterable.iterator<'b> = "values"
@send external keys: t<'a, 'b> => Iterable.iterator<'a> = "keys"
@send external entries: t<'a, 'b> => Iterable.iterator<('a, 'b)> = "entries"
