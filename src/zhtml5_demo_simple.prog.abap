*&---------------------------------------------------------------------*
*& Report zhtml5_demo_simple
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhtml5_demo_simple.

DATA(document) = NEW zcl_html5_document( ).
DATA(html) = document->add_html( ).
DATA(body) = html->add_body( ).
body->add_a( href = 'https://www.sap.com' )->add_text( 'SAP' ).
cl_demo_output=>display_html( document->render( ) ).
