// 95.85638070106506s
// 2
```
PROGRAM CraneLift
VAR
	doConvTop : BOOL;
	doConvBottom : BOOL;
	diConvTop : BOOL;
	diConvBottom : BOOL;
	doLiftTop : BOOL;
	doLiftBottom : BOOL;
	diLiftTop : BOOL;
	diLiftBottom : BOOL;
	doConvLift : BOOL;
	diBoxLift : BOOL;
	doLiftUnload : BOOL;
END_VAR

IF doConvTop THEN
	DO
		IF NOT diConvTop THEN
			DO
				IF NOT doLiftTop THEN
					DO
						IF NOT diLiftTop THEN
							DO
								IF NOT diBoxLift THEN
									DO
										IF doConvLift THEN
											DO
												IF diBoxLift THEN
													DO
														IF doLiftUnload THEN
															DO
															END_IF
														END_IF
													END_IF
												END_DO
											END_IF
										END_DO
									END_IF
								END_DO
							END_IF
						END_DO
					END_IF
				END_DO
			END_IF
		END_IF
	END_DO
ELSE
	DO