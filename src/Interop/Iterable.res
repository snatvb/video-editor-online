type iterator<'a>

%%raw(`function __map(iterator, fn) {
    let result = []
    for (const item of iterator) {
        result.push(fn(item))
    }
    return result
}`)

@val external __map: (iterator<'a>, 'a => 'b) => array<'b> = "__map"

let map = __map
