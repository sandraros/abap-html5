"! <p class="shorttext synchronized" lang="en">Category "Flow Content"</p>
INTERFACE zif_html5_category_flow
  PUBLIC .

  INTERFACES zif_html5_node.

  ALIASES render FOR zif_html5_node~render.

  ALIASES add_text FOR zif_html5_node~add_text.

*  METHODS add_text
*    IMPORTING
*      text          TYPE csequence
*    RETURNING
*      VALUE(result) TYPE REF TO zcl_html5_text
*    RAISING
*      zcx_html5.

ENDINTERFACE.
