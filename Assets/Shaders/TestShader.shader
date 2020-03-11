// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "TestShader/Fog"
{
	Properties
	{
		_MainColour("Main Colour", Color) = (0.4043699,0.8207547,0.360048,0)
		_EdgeLength ( "Edge length", Range( 2, 50 ) ) = 15
		_SecondaryColour("Secondary Colour", Color) = (0.2282841,0.3584906,0.2344844,0)
		_Float0("Float 0", Float) = 7.5
		_TransitionDistance("Transition Distance", Float) = 20
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface surf StandardCustomLighting keepalpha addshadow fullforwardshadows noforwardadd vertex:vertexDataFunc 
		struct Input
		{
			float3 worldPos;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		uniform float4 _MainColour;
		uniform float4 _SecondaryColour;
		uniform float _TransitionDistance;
		uniform float _Float0;
		uniform float _EdgeLength;

		void vertexDataFunc( inout appdata_full v )
		{
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			c.rgb = 0;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			o.Normal = float3(0,0,1);
			float3 ase_worldPos = i.worldPos;
			float clampResult11 = clamp( pow( ( distance( ase_worldPos , _WorldSpaceCameraPos ) / _TransitionDistance ) , _Float0 ) , 0.0 , 1.0 );
			float4 lerpResult12 = lerp( _MainColour , _SecondaryColour , clampResult11);
			o.Emission = lerpResult12.rgb + 1E-5;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17800
318;73;1278;747;761.0662;273.5948;1;True;True
Node;AmplifyShaderEditor.WorldSpaceCameraPos;4;-1443.99,520.4865;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldPosInputsNode;3;-1441.771,382.6215;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;8;-958.0174,471.6473;Inherit;False;Property;_TransitionDistance;Transition Distance;8;0;Create;True;0;0;False;0;20;20;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;5;-1156.79,403.8273;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;6;-735.0762,404.0804;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-749.6019,513.4178;Inherit;False;Property;_Float0;Float 0;7;0;Create;True;0;0;False;0;7.5;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;9;-578.983,405.1603;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1;-860.1445,-108.2749;Inherit;False;Property;_MainColour;Main Colour;0;0;Create;True;0;0;False;0;0.4043699,0.8207547,0.360048,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;2;-860.9192,70.24291;Inherit;False;Property;_SecondaryColour;Secondary Colour;6;0;Create;True;0;0;False;0;0.2282841,0.3584906,0.2344844,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;11;-380.192,449.3014;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;12;-178.0128,359.9825;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;6;ASEMaterialInspector;0;0;Standard;TestShader/Fog;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;3;0
WireConnection;5;1;4;0
WireConnection;6;0;5;0
WireConnection;6;1;8;0
WireConnection;9;0;6;0
WireConnection;9;1;10;0
WireConnection;11;0;9;0
WireConnection;12;0;1;0
WireConnection;12;1;2;0
WireConnection;12;2;11;0
WireConnection;0;15;12;0
ASEEND*/
//CHKSM=90B5D9C4192CBAA28A21C27C7ECE645550AC9D4A