"! <p class="shorttext synchronized" lang="en">Node</p>
INTERFACE zif_html5_node
  PUBLIC .

  METHODS add_text
    IMPORTING
      text          TYPE csequence
    RETURNING
      VALUE(result) TYPE REF TO zcl_html5_text
    RAISING
      zcx_html5.

  METHODS render
    RETURNING
      VALUE(result) TYPE string.

  METHODS get_non_transparent_ascendant
    RETURNING
      VALUE(ascendant) TYPE REF TO zif_html5_node.

  DATA: parent   TYPE REF TO zif_html5_node READ-ONLY,
        children TYPE STANDARD TABLE OF REF TO zif_html5_node READ-ONLY.

ENDINTERFACE.
