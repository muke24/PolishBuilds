// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/Colour"
{
    // Input variables from the inspector
    Properties
    {
        _Colour("Colour", Color) = (1,1,1,1)
    }

        SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vertexPos
            #pragma fragment pixelColour
            float4 vertexPos(float4 vertex : POSITION) : SV_POSITION
            {
                return UnityObjectToClipPos(vertex);
            }
            fixed4 _Colour;
            fixed4 pixelColour() :SV_Target
            {
                return _Colour;
            }
            ENDCG
        }
    }
}
