type t
type config
type uint8Array = File.uint8Array
type progressEvent = {ratio: float}

@obj
external makeOptions: (~log: bool=?, ~corePath: string=?) => config = ""

@module("@ffmpeg/ffmpeg") external create: config => t = "createFFmpeg"
@module("@ffmpeg/ffmpeg") external fetchFile: File.t => Promise.t<uint8Array> = "fetchFile"

@send external load: t => Promise.t<unit> = "load"
@variadic @send external run: (t, array<string>) => Promise.t<unit> = "run"
@send external fs: (t, [#writeFile | #readFile], string, uint8Array) => Promise.t<unit> = "FS"
@send external readData: (t, @as("readFile") _, string) => uint8Array = "FS"
@send external onProgress: (t, progressEvent => unit) => unit = "setProgress"
@send external clear: (t, @as("unlink") _, string) => unit = "FS"

let deafultOptions = makeOptions(~log=true, ~corePath="ffmpeg-core/ffmpeg-core.js")
