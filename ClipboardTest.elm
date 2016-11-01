module ClipboardTest exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Html.App as App


main : Program Never
main =
    App.beginnerProgram
        { model = init
        , view = view
        , update = update
        }


type alias Model =
    String


init : Model
init =
    ""


type Action
    = NoOp
    | Change String


update : Action -> Model -> Model
update action model =
    case action of
        Change text ->
            text

        NoOp ->
            model


view : Model -> Html Action
view model =
    div []
        [ input [ type' "text", id "clipbait", onInput Change ] []
        , button [ attribute "data-clipboard-target" "#clipbait" ] [ text ("Clip:  " ++ model) ]
        ]
