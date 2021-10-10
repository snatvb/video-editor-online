type t
type file
type config

@obj
external makeOptions: (
  ~log: bool=?,
  unit,
) => config = ""

@module("@ffmpeg/ffmpeg") external create: config => t = "createFFMpeg"
@module("@ffmpeg/ffmpeg") external fetchFile: string => Promise.t<file> = "fetchFile"

// @send @val external load: unit => Promise.t<unit> = "load"
// @send @val external fs: ([#writeFile | #readFile], string, string) => Promise.t<unit> = "FS"
