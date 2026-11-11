buah = ["apel", "jeruk", "mangga", "pisang"]

# Hitung jumlah
IO.puts(length(buah))

# Ubah semua jadi huruf besar
besar = Enum.map(buah, fn b -> String.upcase(b) end)
IO.inspect(besar)

# Ambil yang namanya lebih dari 5 huruf
panjang = Enum.filter(buah, fn b -> String.length(b) > 5 end)
IO.inspect(panjang)

# Versi pipe: data mengalir dari atas ke bawah
buah
|> Enum.map(fn b -> String.upcase(b) end)
|> Enum.filter(fn b -> String.length(b) > 5 end)
|> IO.inspect()
