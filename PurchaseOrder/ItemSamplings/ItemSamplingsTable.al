table 50139 ItemSamlingsTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item Sampling Value"; code[50])
        {
            DataClassification = ToBeClassified;
           
        }

        field(2; Description; Text[30])
        {
            DataClassification = ToBeClassified;
            
        }

        field(3; SamplingScope; Text[20])
        {
            Caption = 'Order';
            DataClassification = ToBeClassified;
            
            
        }

        field(4; QuantitySpecification; Enum QuantitySpecification)
        {
            Caption = 'Quantity Specification';
            DataClassification = ToBeClassified;
            
        }

        field(5; Value; Decimal)
        {
            DataClassification = ToBeClassified;
            
        }


        field(6; FullBlocking; Boolean)
        {
            Caption = 'Full Blocking';
        
        }
        field(7; Pourcentage; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        
        field(8; "Specified Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
       
          key(Key1; "Item Sampling Value")
        {
            Clustered = true;
        }
        
     
      
        
        
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

 trigger OnModify()
var
    OriginalValue: Decimal;
    Percentage: Decimal;
    NewValue: Decimal;
begin
    OriginalValue := rec.Value;
    Percentage := rec.Pourcentage;
    if rec.QuantitySpecification = rec.QuantitySpecification::VariableQuantity then
    begin
        // Calculate the new value after applying the percentage decrease
        NewValue := rec."Specified Value" * (Percentage / 100);
        // Assign the calculated value to the Value field
        rec.Value := NewValue;
        // Now you can use the NewValue as needed
       // Message('New value after modifying Specified Value: %1', NewValue);
    end;
end;



    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;



}

enum 50137 QuantitySpecification
{
    Extensible = true;

    value(0; FixedQuantity) { Caption = 'Fixed Quantity'; }
    value(1; VariableQuantity) { Caption = 'Variable Quantity'; }

}