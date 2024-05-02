tableextension 50114 PurchaseHeaderExt extends "Purchase Header"
{
    fields
    {
        field(50100; "Total Quantity"; Decimal)
        {
            Caption = 'Total Quantity';
            DecimalPlaces = 0 : 5;
            CalcFormula = sum("Purchase Line".Quantity where("Document Type" = field("Document Type"),
                                                         "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50101; "Number Of Lines"; Integer)
        {
            Caption = 'Number Of Lines';
            CalcFormula = count("Purchase Line" where("Document Type" = field("Document Type"),
                                                         "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        
    }
}

pageextension 50114 PurchaseOrderListExt extends "Purchase Order List"
{
    layout
    {
        addafter(Amount)
        {
            field("Total Quantity"; Rec."Total Quantity")
            {
                ApplicationArea = All;
            }
            field("Number Of Lines"; Rec."Number Of Lines")
            {
                ApplicationArea = All;
            }
           
        }
    }
   
}
tableextension 50116 PurchaseLineext extends "Purchase Line"
{
    fields
    {
         field(50102; QualityOrder; Code[100])
        {
            TableRelation=CheckQualityOrderTable.QualityOrder;
        }
    }
    
}