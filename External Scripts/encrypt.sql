create master key encryption by password = '<complex password>'

create certificate EncryptedCert with Subject = 'DB Encrypted Certificate'

create symmetric key EncryptedKey with ALGORITHM = AES_256 encryption by CERTIFICATE EncryptedCert

open symmetric key EncryptedKey decryption by Certificate EncryptedCert

create table test_encrypt (
IdentCode int identity(1,1) not null
,BLZ		int
,KontoNr	bigint
,Vorname	varchar(100)
,Nachname   varchar(100)
,BLZ_encr	

select convert(varchar(10)
,decryptbykey(
ENCRYPTBYKEY( key_GUID('EncryptedKey'),'1'))
)

select en

,1, HASHBYTES('SHA2_128',convert(varbinary, 1)))

0x00CEC91442D79E4A82DF0982D5082A09020000004AEA6D999FEFB973279BB036119E45C0C57582FDDE894FEB758EC4062C849572
0x00CEC91442D79E4A82DF0982D5082A090200000037D604D7A9A59ED80A5F900BBF6F582D5B29905AA2E4A5159DF9907E223D4570
0x00CEC91442D79E4A82DF0982D5082A0902000000BB5BC4E1B8EE067FC82FF8EEB1F88DC1C65887068CF98660A1E992782EB4AC5DD6E61F9D8F8585AC1280B34DB183D11D


select ENCRYPTBYPASSPHRASE(
