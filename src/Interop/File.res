type t = {name: string, size: int}
type uint8Array
type buffer
type blob

let sizeToString = size => {
  let kb = size / 1024
  let mb = kb / 1024
  `${mb->Belt.Int.toString}mb ${(kb - mb * 1024)->Belt.Int.toString}kb`
}

let getSizeAsString = file => file.size->sizeToString
// let toSrc = file => URL.createObjectURL(file)

@val @scope("URL") external toSrc: t => string = "createObjectURL"

@get external getBufffer: uint8Array => buffer = "buffer"

module Blob = {
  type t = blob
  type config

  @obj
  external makeConfig: (~type_: string=?) => config = ""

  @new external make: (array<buffer>, config) => t = "Blob"

  let makeVideo = make(_, makeConfig(~type_="video/mp4"))

  %%raw(`
    const __saveAs__ = (function () {
      const a = document.createElement("a");
      document.body.appendChild(a);
      a.style = "display: none";
      return function (blob, fileName) {
          const url = window.URL.createObjectURL(blob);
          a.href = url;
          a.download = fileName;
          a.click();
          window.URL.revokeObjectURL(url);
      };
  }());`)

  let saveAs: (t, string) => unit = %raw(`__saveAs__`)
}
