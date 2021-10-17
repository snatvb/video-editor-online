type t = {name: string, size: int}

let sizeToString = size => {
  let kb = size / 1024
  let mb = kb / 1024
  `${mb->Belt.Int.toString}mb ${(kb - mb * 1024)->Belt.Int.toString}kb`
}

let getSizeAsString = file => file.size->sizeToString
// let toSrc = file => URL.createObjectURL(file)

@val @val external toSrc: t => string = "URL.createObjectURL"