@escapeRegEx = (string) ->
  string.replace /([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1"

@replaceSubstrings = (string, find, replace) ->
  string.replace new RegExp(escapeRegEx(find), "g"), replace

@joinStrings = (stringArray, join) ->
  sep = join or ", "
  res = ""
  _.each stringArray, (str) ->
    if str
      res = res + sep  if res
      res = res + str
    return

  res
