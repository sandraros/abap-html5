"! <p class="shorttext synchronized" lang="en">HTML element</p>
CLASS zcl_html5_element_html DEFINITION
  INHERITING FROM zcl_html5_element_normal
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_html5_content_flow.

    METHODS constructor
      IMPORTING
        parent TYPE REF TO zcl_html5_node.

    METHODS add_body
      RETURNING
        VALUE(body) TYPE REF TO zcl_html5_element_body.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_html5_element_html IMPLEMENTATION.


  METHOD constructor.

    super->constructor( parent = parent tag = 'html' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD add_body.

    body = NEW #( parent = me ).
*    APPEND body TO content_nodes.

  ENDMETHOD.


ENDCLASS.
