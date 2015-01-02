#
#   Returns property value, where property name is given as path.
#
#   Example:
#
#       getPropertyValue("x.y.z", {x: { y: { z: 123}}});
#
getPropertyValue = (propertyName, obj) ->
  propertyName.split(".").reduce ((o, i) ->
    o[i]
  ), obj


#
#   converts properties in format { "x.y": "z" } to { x: { y: "z" } }
#
deepen = (o) ->
  oo = {}
  t = undefined
  parts = undefined
  part = undefined
  for k of o
    t = oo
    parts = k.split(".")
    key = parts.pop()
    while parts.length
      part = parts.shift()
      t = t[part] = t[part] or {}
    t[key] = o[k]
  oo


#
#	Function converts array of objects to csv, tsv or json string
#
#	exportFields: list of object keys to export (array of strings)
#	fileType: can be "json", "csv", "tsv" (string)
#
convertArrayOfObjects = (data, exportFields, fileType) ->
  data = data or []
  fileType = fileType or "csv"
  exportFields = exportFields or []
  str = ""

  # export to JSON
  if fileType is "json"
    tmp = []
    _.each data, (doc) ->
      obj = {}
      _.each exportFields, (field) ->
        obj[field] = doc[field]
        return

      tmp.push obj
      return

    str = JSON.stringify(tmp)

  # export to CSV or TSV
  if fileType is "csv" or fileType is "tsv"
    columnSeparator = ""
    columnSeparator = ","  if fileType is "csv"
    columnSeparator = "\t"  if fileType is "tsv"
    _.each exportFields, (field, i) ->
      str = str + columnSeparator  if i > 0
      str = str + "\"" + field + "\""
      return

    str = str + "\r\n"
    _.each data, (doc) ->
      _.each exportFields, (field, i) ->
        str = str + columnSeparator  if i > 0
        if typeof (doc[field]) is "undefined"
          str = str + "\"\""
        else
          str = str + "\"" + doc[field] + "\""
        return

      str = str + "\r\n"
      return

  str
