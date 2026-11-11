defmodule BatuGuntingKertas do
  @pilihan ["batu", "gunting", "kertas"]

  def mulai do
    IO.puts("=== Batu Gunting Kertas ===")
    IO.puts("Ketik batu, gunting, atau kertas. Ketik keluar untuk berhenti.\n")
    main(0, 0)
  end

  defp main(skor_kamu, skor_komputer) do
    input =
      IO.gets("Pilihanmu: ")
      |> String.trim()
      |> String.downcase()

    cond do
      input == "keluar" ->
        IO.puts("\nSkor akhir -> Kamu: #{skor_kamu}, Komputer: #{skor_komputer}")
        IO.puts("Sampai jumpa!")

      input in @pilihan ->
        komputer = Enum.random(@pilihan)
        IO.puts("Komputer memilih: #{komputer}")

        case hasil(input, komputer) do
          :menang ->
            IO.puts("Kamu menang!\n")
            main(skor_kamu + 1, skor_komputer)

          :kalah ->
            IO.puts("Kamu kalah!\n")
            main(skor_kamu, skor_komputer + 1)

          :seri ->
            IO.puts("Seri!\n")
            main(skor_kamu, skor_komputer)
        end

      true ->
        IO.puts("Pilihan tidak valid, coba lagi.\n")
        main(skor_kamu, skor_komputer)
    end
  end

  defp hasil(sama, sama), do: :seri
  defp hasil("batu", "gunting"), do: :menang
  defp hasil("gunting", "kertas"), do: :menang
  defp hasil("kertas", "batu"), do: :menang
  defp hasil(_, _), do: :kalah
end

BatuGuntingKertas.mulai()
