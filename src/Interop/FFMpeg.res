type t
type config
type uint8Array

@obj
external makeOptions: (~log: bool=?, ~corePath: string=?) => config = ""

@module("@ffmpeg/ffmpeg") external create: config => t = "createFFmpeg"
@module("@ffmpeg/ffmpeg") external fetchFile: File.t => Promise.t<uint8Array> = "fetchFile"

@send external load: t => Promise.t<unit> = "load"
@send external run: t => (string, string, string) => Promise.t<unit> = "run"

@send external fs: t => ([#writeFile | #readFile], string, uint8Array) => Promise.t<unit> = "FS"

let ff = create(makeOptions(~log=true, ~corePath="ffmpeg-core/ffmpeg-core.js"))
ff->load->ignore
let fsFF = (kind, name, data) => ff->fs(kind, name, data)