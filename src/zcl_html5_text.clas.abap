"! <p class="shorttext synchronized" lang="en">Text</p>
CLASS zcl_html5_text DEFINITION
  INHERITING FROM zcl_html5_node
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        parent TYPE REF TO zcl_html5_node
        text   TYPE csequence
      RAISING
        zcx_html5.

    METHODS render REDEFINITION.

    DATA: text TYPE string READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_html5_text IMPLEMENTATION.


  METHOD constructor.

    super->constructor( parent = parent ).
    me->text = text.

    DATA(non_transparent_ascendant) = get_non_transparent_ascendant( ).
    IF non_transparent_ascendant IS NOT INSTANCE OF zif_html5_content_phrasing.
      RAISE EXCEPTION TYPE zcx_html5.
    ENDIF.

  ENDMETHOD.


  METHOD render.

    result = escape( val = text format = cl_abap_format=>e_html_text ).

  ENDMETHOD.


ENDCLASS.
