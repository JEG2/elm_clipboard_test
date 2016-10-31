port module ClipboardTest exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Html.App as App


main : Program Never
main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


port clip : String -> Cmd text


type alias Model =
    String


init : ( Model, Cmd Action )
init =
    ( "", Cmd.none )


type Action
    = NoOp
    | Change String
    | Clip String


update : Action -> Model -> ( Model, Cmd Action )
update action model =
    case action of
        Change text ->
            ( text, Cmd.none )

        Clip text ->
            ( model, clip model )

        NoOp ->
            ( model, Cmd.none )


view : Model -> Html Action
view model =
    div []
        [ input [ type' "text", onInput Change ] []
        , button [ onClick (Clip model) ] [ text "Clip Me" ]
        ]


subscriptions : Model -> Sub Action
subscriptions model =
    Sub.none
