"! <p class="shorttext synchronized" lang="en">Node</p>
CLASS zcl_html5_node DEFINITION
  ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_html5_node.

    ALIASES parent FOR zif_html5_node~parent.
    ALIASES add_text FOR zif_html5_node~add_text.
    ALIASES get_non_transparent_ascendant FOR zif_html5_node~get_non_transparent_ascendant.
    ALIASES render FOR zif_html5_node~render.
    ALIASES children FOR zif_html5_node~children.

    METHODS constructor
      IMPORTING
        parent TYPE REF TO zcl_html5_node.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_html5_node IMPLEMENTATION.


  METHOD constructor.

    me->parent = parent.

  ENDMETHOD.


  METHOD zif_html5_node~get_non_transparent_ascendant.

    ascendant = me->parent.
    WHILE ascendant IS BOUND AND ascendant IS INSTANCE OF zif_html5_content_transparent.
      ascendant = ascendant->parent.
    ENDWHILE.
    IF ascendant IS NOT BOUND.
      " TODO ?
    ENDIF.

  ENDMETHOD.


  METHOD zif_html5_node~add_text.

    result = NEW #( parent = me text = text ).

  ENDMETHOD.


  METHOD zif_html5_node~render.

    result = REDUCE #( INIT html5 = `` FOR child IN children NEXT html5 = html5 && child->render( ) ).

  ENDMETHOD.


ENDCLASS.
