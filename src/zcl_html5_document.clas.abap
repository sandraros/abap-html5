"! <p class="shorttext synchronized" lang="en">Document</p>
CLASS zcl_html5_document DEFINITION
  INHERITING FROM zcl_html5_node
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        doctype_legacy_string TYPE abap_bool DEFAULT abap_false.

    METHODS render REDEFINITION.

    METHODS add_html
      RETURNING
        VALUE(html) TYPE REF TO zcl_html5_element_html.

    DATA: html TYPE REF TO zcl_html5_element_html READ-ONLY.

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA: doctype_legacy_string TYPE abap_bool,
          content_nodes         TYPE STANDARD TABLE OF REF TO zif_html5_node WITH EMPTY KEY.

ENDCLASS.



CLASS zcl_html5_document IMPLEMENTATION.


  METHOD constructor.

    super->constructor( parent = VALUE #( ) ). " NO PARENT
    me->doctype_legacy_string = doctype_legacy_string.

  ENDMETHOD.


  METHOD render.

    " EITHER <!DOCTYPE html>
    " OR     <!DOCTYPE html SYSTEM "about:legacy-compat">
    result =
        |<!DOCTYPE html{
        COND #( WHEN doctype_legacy_string = abap_true THEN ' SYSTEM "about:legacy-compat"' ) }>\n{
        REDUCE #( INIT html5 = `` FOR node IN content_nodes NEXT html5 = html5 && node->render( ) ) }>\n|.

  ENDMETHOD.


  METHOD add_html.

    html = NEW #( parent = me ).
    APPEND html TO content_nodes.

  ENDMETHOD.


ENDCLASS.
