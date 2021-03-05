defmodule QuantumExample do
  alias Cronwithregistry.Registry

  def app_task() do
    # app_task(num+1) |> IO.inspect "Hola "<> num

    case HTTPoison.get("https://explodingtopics.com/") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, document} = Floki.parse_document(body)

        titu =
          for {_, _, [title]} <-
                document
                |> Floki.find(".gridContainer")
                |> Floki.find(".topicInfoContainer")
                |> Floki.find(".tileKeyword"),
              do: title

        descrip =
          for {_, _, [descripcion]} <-
                document
                |> Floki.find(".gridContainer")
                |> Floki.find(".topicInfoContainer")
                |> Floki.find(".tileDescription"),
              do: descripcion

        cant =
          for {_, _, [gradient]} <-
                document
                |> Floki.find(".gridContainer")
                |> Floki.find(".topicInfoContainer")
                |> Floki.find(".scoreTagItem"),
              do: gradient

        crecimient =
          for {_, _, [crecimiento]} <-
                document
                |> Floki.find(".gridContainer")
                |> Floki.find(".topicInfoContainer")
                |> Floki.find(".scoreTagGradient"),
              do: crecimiento

        agruparlista(titu, descrip, cant, crecimient)

      # IO.inspect(titu);
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found :(")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end

  def inserta(titulo, descrip, crecimient, porcenta) do
    # for x <- titulo do:
    # buscartitle(titulo)
    # creci =  Regex.split(~r/Ôåæ/,crecimient)
    # porce =  Regex.split(~r/Ôåæ/,porcenta)
    # data = %{titulo: titulo,descripcion: descrip,crecimiento: 2, porcentaje: 3}
    Registry.create_table(Registry, %{
      titulo: titulo,
      descripcion: descrip,
      crecimiento: crecimient,
      porcentaje: porcenta
    })

    #
  end

  # def agruparlista(titulo, descrip,crecimient,porcenta), do: List.zip(titulo,descrip,crecimient,porcenta) |> IO.inspect
  def agruparlista(titulo, descrip, crecimient, porcenta) do
    x = Enum.zip([titulo, descrip, crecimient, porcenta])
    Enum.map(x, fn {title, descri, creci, porcen} -> inserta(title, descri, creci, porcen) end)
    # for n <- titulo, do: %{titulo:titulo, descrip: hd}
  end
end
