

table 50122 "Sequence Number Setup"
{
    Caption = 'Setup Number';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PKEYY; Code[10])
        {
            Caption = 'PKEY';
            DataClassification = ToBeClassified;
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            TableRelation = "No. Series".Code;
        }
    }
    keys
    {
        key(PK; PKEYY)
        {
            Clustered = true;
        }
    }

}