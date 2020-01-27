`dcrlncli changepassword` - Change an encrypted wallet's password at startup.

### Usage:
```
   dcrlncli changepassword [arguments...]
```

### Description:
   
  The changepassword command is used to Change dcrlnd's encrypted wallet's
  password. It will automatically unlock the daemon if the password change
  is successful.

  If one did not specify a password for their wallet (running dcrlnd with
  --noseedbackup), one must restart their daemon without
  --noseedbackup and use this command. The "current password" field
  should be left empty.
  
