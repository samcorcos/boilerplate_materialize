Number::formatMoney = (c, d, t) ->
  n = this
  c = (if isNaN(c = Math.abs(c)) then 2 else c)
  d = (if not d? then "." else d)
  t = (if not t? then "," else t)
  s = (if n < 0 then "-" else "")
  i = parseInt(n = Math.abs(+n or 0).toFixed(c)) + ""
  j = (if (j = i.length) > 3 then j % 3 else 0)
  s + ((if j then i.substr(0, j) + t else "")) + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + ((if c then d + Math.abs(n - i).toFixed(c).slice(2) else ""))
