defmodule TebakAngka do
  def mulai do
    rahasia = Enum.random(1..100)
    IO.puts("Aku memilih angka antara 1 sampai 100. Coba tebak!")
    tebak(rahasia, 1)
  end

  defp tebak(rahasia, percobaan) do
    input = IO.gets("Tebakan ke-#{percobaan}: ")

    case Integer.parse(String.trim(input)) do
      {angka, ""} ->
        periksa(angka, rahasia, percobaan)

      _ ->
        IO.puts("Masukkan angka yang valid ya.")
        tebak(rahasia, percobaan)
    end
  end

  defp periksa(angka, rahasia, percobaan) when angka < rahasia do
    IO.puts("Terlalu kecil!")
    tebak(rahasia, percobaan + 1)
  end

  defp periksa(angka, rahasia, percobaan) when angka > rahasia do
    IO.puts("Terlalu besar!")
    tebak(rahasia, percobaan + 1)
  end

  defp periksa(_angka, _rahasia, percobaan) do
    IO.puts("Benar! Kamu berhasil dalam #{percobaan} tebakan.")
  end
end

TebakAngka.mulai()
