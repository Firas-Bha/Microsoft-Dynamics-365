page 50132 "Check Quality Order Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = CheckQualityOrderTable;

    layout
    {
        area(Content)
        {
            group(QualityCheck)
            {
                Caption='Quality Check';
                field(QualityOrder; rec.QualityOrder)
                {
                    Caption = 'Quality Order';
                    ApplicationArea = All;
                }
                field("Vendor Name"; rec."No.")
                {
                    Caption = 'Name';
                    ApplicationArea = All;
                }
                  
                field(ItemNumber; rec.ItemNumber)
                {
                    Caption = 'Item Number';
                    ApplicationArea = All;
                }
                field(Site; rec.Site)
                {

                    ApplicationArea = All;
                }
                field(Warehouse; rec.Warehouse)
                {
                    ApplicationArea = All;
                }


                field(AccountSelection; rec.AccountSelection)
                {
                    Caption = 'Account Selection';
                    ApplicationArea = All;
                }

                field(ReferenceNumber; rec.ReferenceNumber)
                {
                    Caption = 'Reference Number';
                    ApplicationArea = All;
                }

                field(TestGroup; rec.TestGroup)
                {
                    Caption = 'Test Group';
                    ApplicationArea = All;
                }
                /*
                field(Quantity; rec.Quantity)
                {
                    Caption = 'Quantity';
                    ApplicationArea = All;
                }
                */
                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                    Editable=false;
                }
                field(ReferenceType; rec.ReferenceType)
                {
                    Caption = 'Reference Type';
                    ApplicationArea = All;
                }
                  field(Quantityy; rec.Quantityy)
                    {
                        Caption = 'Quantityy';
                        ApplicationArea = All;        
                    }
                
            }
            group(QualityResultsList)
            {
                Caption = 'Test Group Records';
                part(TestPage; QualityResultsList)
                {
                    Caption = 'Export Excel';
                    ApplicationArea = All;
                    SubPageLink = "QualityOrder" = field("QualityOrder");
                    UpdatePropagation = Both;

                }
            }
          
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;

    trigger OnAfterGetCurrRecord()
    var

        ReferenceType: Code[20];
        MyCardPage: Page "Check Quality Order Card";
    begin
        ReferenceType := 'Purchase';
        rec.ReferenceType := ReferenceType;

    end;
    
trigger OnOpenPage()
    var
        no: Code[20];
    begin
        if Rec.IsEmpty() then
            Rec.Insert();
        No := 'AAA123123';
        no := IncStr(No);
    end;

/*
    trigger OnAfterGetRecord()
         var
        AccountRec: Record "CheckQualityOrderTable";
        Name: Text[100];

        begin
            // Retrieve the account record
            if AccountRec.GET(rec.AccountSelection) then
            begin
                // Assign the account name to the name field
               AccountRec.AccountName := AccountRec.AccountName;
            end;

    end;
*/
}