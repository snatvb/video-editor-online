type t
type file
type config

@obj
external makeOptions: (~log: bool=?) => config = ""

@module("@ffmpeg/ffmpeg") external create: config => t = "createFFmpeg"
@module("@ffmpeg/ffmpeg") external fetchFile: string => Promise.t<file> = "fetchFile"

@send external load: unit => Promise.t<unit> = "load"

@send external fs: ([#writeFile | #readFile], string, string) => Promise.t<unit> = "FS"

let ff = create(makeOptions(~log=true))
