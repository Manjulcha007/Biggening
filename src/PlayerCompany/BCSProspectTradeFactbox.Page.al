page 88017 "BCS Prospect Trade Factbox"
{

    Caption = 'BCS Prospect Trade Factbox';
    PageType = ListPart;
    SourceTable = "BCS Prospect Trades";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                }
                field("Prod. Posting Group"; "Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Item Category Code"; "Item Category Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
