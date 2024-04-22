page 50102 "Number Setup"
{

    Caption = 'Value Setup';
    PageType = Card;
    SourceTable = "Number Setup";
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        no: Code[20];
    begin
        if Rec.IsEmpty() then
            Rec.Insert();
        No := 'AAA123123';
        no := IncStr(No);
    end;
}