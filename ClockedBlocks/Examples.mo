within Modelica_DeviceDrivers.ClockedBlocks;
package Examples
  extends Modelica.Icons.ExamplesPackage;

  model TestSerialPackager
  extends Modelica.Icons.Example;
    Modelica.Blocks.Sources.IntegerExpression integerExpression(y=integer(3*sin(
          time) + 3))
      annotation (Placement(transformation(extent={{-100,30},{-80,50}})));
    ClockedBlocks.Packaging.SerialPackager.Packager packager
      annotation (Placement(transformation(extent={{-50,70},{-30,90}})));
    ClockedBlocks.Packaging.SerialPackager.PackUnsignedInteger packInt(nu=1, width=10)
      annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
    ClockedBlocks.Packaging.SerialPackager.AddInteger addInteger(nu=1)
      annotation (Placement(transformation(extent={{-50,-46},{-30,-26}})));
    Modelica.Blocks.Sources.IntegerExpression integerExpression2(y=integer(5*sin(
          time)))
      annotation (Placement(transformation(extent={{-100,-46},{-80,-26}})));
    Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=integer(5*sin(
          time) + 5))
      annotation (Placement(transformation(extent={{-100,-8},{-80,12}})));
    ClockedBlocks.Packaging.SerialPackager.PackUnsignedInteger packInt1(
      nu=1,
      bitOffset=5,
      width=10)
      annotation (Placement(transformation(extent={{-50,-8},{-30,12}})));
    ClockedBlocks.Packaging.SerialPackager.ResetPointer resetPointer(nu=1)
      annotation (Placement(transformation(extent={{26,66},{46,86}})));
    ClockedBlocks.Packaging.SerialPackager.UnpackUnsignedInteger unpackInt(nu=1, width=10)
      annotation (Placement(transformation(extent={{26,32},{46,52}})));
    ClockedBlocks.Packaging.SerialPackager.GetInteger getInteger
      annotation (Placement(transformation(extent={{26,-42},{46,-22}})));
    ClockedBlocks.Packaging.SerialPackager.UnpackUnsignedInteger unpackInt1(
      nu=1,
      bitOffset=5,
      width=10) annotation (Placement(transformation(extent={{26,-4},{46,16}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.SampleClocked
                                                               sample1
      annotation (Placement(transformation(extent={{-72,34},{-60,46}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.SampleClocked
                                                               sample2
      annotation (Placement(transformation(extent={{-72,-4},{-60,8}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.SampleClocked
                                                               sample3
      annotation (Placement(transformation(extent={{-72,-42},{-60,-30}})));
    Modelica_Synchronous.Clocks.PeriodicRealClock periodicRealClock(period=
          0.1)
      annotation (Placement(transformation(extent={{-98,-82},{-78,-62}})));
  equation
    connect(packager.pkgOut, packInt.pkgIn) annotation (Line(
        points={{-40,69.2},{-40,50.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(packInt.pkgOut[1], packInt1.pkgIn) annotation (Line(
        points={{-40,29.2},{-40,12.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(packInt1.pkgOut[1], addInteger.pkgIn) annotation (Line(
        points={{-40,-8.8},{-40,-25.2}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(addInteger.pkgOut[1], resetPointer.pkgIn) annotation (Line(
        points={{-40,-46.8},{-40,-56},{0,-56},{0,94},{36,94},{36,86.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(resetPointer.pkgOut[1], unpackInt.pkgIn) annotation (Line(
        points={{36,65.2},{36,52.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(unpackInt.pkgOut[1], unpackInt1.pkgIn) annotation (Line(
        points={{36,31.2},{36,16.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(unpackInt1.pkgOut[1], getInteger.pkgIn) annotation (Line(
        points={{36,-4.8},{36,-21.2}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(integerExpression.y, sample1.u) annotation (Line(
        points={{-79,40},{-73.2,40}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(sample1.y, packInt.u) annotation (Line(
        points={{-59.4,40},{-52,40}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(integerExpression1.y, sample2.u) annotation (Line(
        points={{-79,2},{-73.2,2}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(sample2.y, packInt1.u) annotation (Line(
        points={{-59.4,2},{-52,2}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(integerExpression2.y, sample3.u) annotation (Line(
        points={{-79,-36},{-73.2,-36}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(sample3.y, addInteger.u[1]) annotation (Line(
        points={{-59.4,-36},{-52,-36}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample1.clock) annotation (Line(
        points={{-77,-72},{-56,-72},{-56,28},{-66,28},{-66,32.8}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(sample2.clock, periodicRealClock.y) annotation (Line(
        points={{-66,-5.2},{-66,-18},{-56,-18},{-56,-72},{-77,-72}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(sample3.clock, periodicRealClock.y) annotation (Line(
        points={{-66,-43.2},{-66,-72},{-77,-72}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-100,
              -100},{100,100}}), graphics), experiment(StopTime=1.1));
  end TestSerialPackager;

  model TestSerialPackager_UDP
  extends Modelica.Icons.Example;
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.Packager
                       packager
      annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.AddReal
                      addReal(n=3, nu=1)
      annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
    Modelica.Blocks.Sources.RealExpression realExpression[3](y=sin(time)*{1,2,3})
      annotation (Placement(transformation(extent={{-96,20},{-76,40}})));
    Modelica_DeviceDrivers.ClockedBlocks.Communication.UDPSend
                                    uDPSend(port_send=10002)
                                                   annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,-50})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.AddInteger
                         addInteger(nu=1)
      annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
    Modelica.Blocks.Sources.IntegerExpression integerExpression(y=integer(10*sin(
          time)))
      annotation (Placement(transformation(extent={{-96,-20},{-76,0}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.SampleClocked
                                                               sample1
      annotation (Placement(transformation(extent={{-66,-16},{-54,-4}})));
    Modelica_Synchronous.RealSignals.SampleAndHolds.SampleClocked
                                                            sample2[3]
      annotation (Placement(transformation(extent={{-66,24},{-54,36}})));
    Modelica_Synchronous.Clocks.PeriodicRealClock periodicRealClock(period=
          0.1)
      annotation (Placement(transformation(extent={{-94,-90},{-74,-70}})));
    Modelica_DeviceDrivers.ClockedBlocks.Communication.UDPReceive
                                   uDPReceive(port_recv=10002)
                                        annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={30,70})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.GetReal
                      getReal(n=3, nu=1)
      annotation (Placement(transformation(extent={{20,20},{40,40}})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.GetInteger
                         getInteger
      annotation (Placement(transformation(extent={{20,-20},{40,0}})));
    Modelica_Synchronous.RealSignals.SampleAndHolds.AssignClock  assignClock1[3]
      annotation (Placement(transformation(extent={{52,24},{64,36}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.AssignClock
      assignClock2
      annotation (Placement(transformation(extent={{52,-16},{64,-4}})));
  equation
    connect(packager.pkgOut, addReal.pkgIn) annotation (Line(
        points={{-30,59.2},{-30,40.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(addReal.pkgOut[1], addInteger.pkgIn) annotation (Line(
        points={{-30,19.2},{-30,0.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(addInteger.pkgOut[1], uDPSend.pkgIn) annotation (Line(
        points={{-30,-20.8},{-30,-30},{-30,-39.2},{-30,-39.2}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(integerExpression.y, sample1.u) annotation (Line(
        points={{-75,-10},{-67.2,-10}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(sample1.y, addInteger.u[1]) annotation (Line(
        points={{-53.4,-10},{-42,-10}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample1.clock) annotation (Line(
        points={{-73,-80},{-60,-80},{-60,-17.2}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(realExpression.y, sample2.u) annotation (Line(
        points={{-75,30},{-67.2,30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(sample2.y, addReal.u) annotation (Line(
        points={{-53.4,30},{-42,30}},
        color={0,0,127},
        smooth=Smooth.None));

    connect(periodicRealClock.y, sample2[1].clock) annotation (Line(
        points={{-73,-80},{-48,-80},{-48,12},{-60,12},{-60,22.8}},
        color={128,0,255},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample2[2].clock) annotation (Line(
        points={{-73,-80},{-48,-80},{-48,12},{-60,12},{-60,22.8}},
        color={128,0,255},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample2[3].clock) annotation (Line(
        points={{-73,-80},{-48,-80},{-48,12},{-60,12},{-60,22.8}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));

    connect(uDPReceive.pkgOut,getReal. pkgIn) annotation (Line(
        points={{30,59.2},{30,50},{30,50},{30,40.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(getReal.pkgOut[1],getInteger. pkgIn) annotation (Line(
        points={{30,19.2},{30,0.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(getReal.y, assignClock1.u) annotation (Line(
        points={{41,30},{50.8,30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(getInteger.y[1], assignClock2.u) annotation (Line(
        points={{41,-10},{50.8,-10}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock2.clock) annotation (Line(
        points={{-73,-80},{58,-80},{58,-17.2}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1[1].clock) annotation (Line(
        points={{-73,-80},{78,-80},{78,8},{58,8},{58,22.8}},
        color={128,0,255},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1[2].clock) annotation (Line(
        points={{-73,-80},{78,-80},{78,8},{58,8},{58,22.8}},
        color={128,0,255},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1[3].clock) annotation (Line(
        points={{-73,-80},{78,-80},{78,8},{58,8},{58,22.8}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics), experiment(StopTime=1.1));
  end TestSerialPackager_UDP;

  model TestSerialPackagerBitPack_UDP
  extends Modelica.Icons.Example;
    Modelica_DeviceDrivers.ClockedBlocks.Communication.UDPSend
                                    uDPSend(port_send=10002)
                                                   annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-28,-68})));
    Modelica.Blocks.Sources.IntegerExpression integerExpression(y=integer(5*sin(
          time) + 10))
      annotation (Placement(transformation(extent={{-94,16},{-74,36}})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.Packager
                            packager
      annotation (Placement(transformation(extent={{-38,80},{-18,100}})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.PackUnsignedInteger
                                                                     packInt(
        width=10, bitOffset=0,
      nu=1)
      annotation (Placement(transformation(extent={{-38,16},{-18,36}})));
    Modelica_DeviceDrivers.ClockedBlocks.Communication.UDPReceive
                              uDPReceive2_1(port_recv=10002) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={30,86})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.UnpackUnsignedInteger
                                         unpackInt(width=10, nu=1)
      annotation (Placement(transformation(extent={{20,14},{40,34}})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.PackUnsignedInteger
                                                                     packInt1(
        width=10, bitOffset=20,
      nu=1)
      annotation (Placement(transformation(extent={{-38,-16},{-18,4}})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.AddInteger
                              addInteger1(n=1, nu=1)
      annotation (Placement(transformation(extent={{-38,-46},{-18,-26}})));
    Modelica.Blocks.Sources.IntegerExpression integerExpression1(y=integer(10*sin(
          time) + 10))
      annotation (Placement(transformation(extent={{-94,-16},{-74,4}})));
    Modelica.Blocks.Sources.IntegerConstant integerConstant1(k=4)
      annotation (Placement(transformation(extent={{-94,-46},{-74,-26}})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.UnpackUnsignedInteger
                                         unpackInt1(width=10, bitOffset=20,
      nu=1)
      annotation (Placement(transformation(extent={{20,-16},{40,4}})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.GetInteger
                         getInteger1(n=1)
      annotation (Placement(transformation(extent={{20,-52},{40,-32}})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.AddReal
                           addReal(n=3, nu=1)
      annotation (Placement(transformation(extent={{-38,48},{-18,68}})));
    Modelica_DeviceDrivers.ClockedBlocks.Packaging.SerialPackager.GetReal
                           getReal(n=3, nu=1)
      annotation (Placement(transformation(extent={{20,46},{40,66}})));
    Modelica.Blocks.Sources.RealExpression realExpression[3](y=sin(time)*{1,2,3})
      annotation (Placement(transformation(extent={{-94,48},{-74,68}})));
    Modelica_Synchronous.Clocks.PeriodicRealClock periodicRealClock(period=
          0.1)
      annotation (Placement(transformation(extent={{-94,-94},{-74,-74}})));
    Modelica_Synchronous.RealSignals.SampleAndHolds.SampleClocked
                                                            sample2[3]
      annotation (Placement(transformation(extent={{-64,52},{-52,64}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.SampleClocked
                                                               sample1
      annotation (Placement(transformation(extent={{-64,20},{-52,32}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.SampleClocked
                                                               sample3
      annotation (Placement(transformation(extent={{-64,-12},{-52,0}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.SampleClocked
                                                               sample4
      annotation (Placement(transformation(extent={{-64,-42},{-52,-30}})));
    Modelica_Synchronous.RealSignals.SampleAndHolds.AssignClock  assignClock1[3]
      annotation (Placement(transformation(extent={{54,50},{66,62}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.AssignClock
      assignClock2
      annotation (Placement(transformation(extent={{54,18},{66,30}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.AssignClock
      assignClock3
      annotation (Placement(transformation(extent={{54,-12},{66,0}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.AssignClock
      assignClock4
      annotation (Placement(transformation(extent={{54,-48},{66,-36}})));
  equation
    connect(packager.pkgOut, addReal.pkgIn) annotation (Line(
        points={{-28,79.2},{-28,68.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(addReal.pkgOut[1], packInt.pkgIn) annotation (Line(
        points={{-28,47.2},{-28,36.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(packInt.pkgOut[1], packInt1.pkgIn) annotation (Line(
        points={{-28,15.2},{-28,4.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(packInt1.pkgOut[1], addInteger1.pkgIn) annotation (Line(
        points={{-28,-16.8},{-28,-25.2}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(addInteger1.pkgOut[1], uDPSend.pkgIn) annotation (Line(
        points={{-28,-46.8},{-28,-52},{-28,-57.2},{-28,-57.2}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(uDPReceive2_1.pkgOut, getReal.pkgIn) annotation (Line(
        points={{30,75.2},{30,71.4},{30,66.8},{30,66.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(getReal.pkgOut[1], unpackInt.pkgIn) annotation (Line(
        points={{30,45.2},{30,34.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(unpackInt.pkgOut[1], unpackInt1.pkgIn) annotation (Line(
        points={{30,13.2},{30,4.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(unpackInt1.pkgOut[1], getInteger1.pkgIn) annotation (Line(
        points={{30,-16.8},{30,-31.2}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(realExpression.y, sample2.u) annotation (Line(
        points={{-73,58},{-65.2,58}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(sample2.y, addReal.u) annotation (Line(
        points={{-51.4,58},{-40,58}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample4.clock) annotation (Line(
        points={{-73,-84},{-58,-84},{-58,-43.2}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(integerConstant1.y, sample4.u) annotation (Line(
        points={{-73,-36},{-65.2,-36}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(sample4.y, addInteger1.u[1]) annotation (Line(
        points={{-51.4,-36},{-40,-36}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(integerExpression1.y, sample3.u) annotation (Line(
        points={{-73,-6},{-65.2,-6}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(sample3.y, packInt1.u) annotation (Line(
        points={{-51.4,-6},{-40,-6}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(integerExpression.y, sample1.u) annotation (Line(
        points={{-73,26},{-65.2,26}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(sample1.y, packInt.u) annotation (Line(
        points={{-51.4,26},{-40,26}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample3.clock) annotation (Line(
        points={{-73,-84},{-46,-84},{-46,-20},{-58,-20},{-58,-13.2}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample1.clock) annotation (Line(
        points={{-73,-84},{-46,-84},{-46,14},{-58,14},{-58,18.8}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample2[1].clock) annotation (Line(
        points={{-73,-84},{-46,-84},{-46,46},{-58,46},{-58,50.8}},
        color={128,0,255},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample2[2].clock) annotation (Line(
        points={{-73,-84},{-46,-84},{-46,46},{-58,46},{-58,50.8}},
        color={128,0,255},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample2[3].clock) annotation (Line(
        points={{-73,-84},{-46,-84},{-46,46},{-58,46},{-58,50.8}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(unpackInt.y, assignClock2.u) annotation (Line(
        points={{41,24},{52.8,24}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(unpackInt1.y, assignClock3.u) annotation (Line(
        points={{41,-6},{52.8,-6}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(getInteger1.y[1], assignClock4.u) annotation (Line(
        points={{41,-42},{52.8,-42}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock4.clock) annotation (Line(
        points={{-73,-84},{60,-84},{60,-49.2}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock3.clock) annotation (Line(
        points={{-73,-84},{74,-84},{74,-28},{60,-28},{60,-13.2}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock2.clock) annotation (Line(
        points={{-73,-84},{74,-84},{74,8},{60,8},{60,16.8}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1[1].clock) annotation (Line(
        points={{-73,-84},{74,-84},{74,40},{60,40},{60,48.8}},
        color={128,0,255},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(getReal.y, assignClock1.u) annotation (Line(
        points={{41,56},{52.8,56}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1[2].clock) annotation (Line(
        points={{-73,-84},{74,-84},{74,40},{60,40},{60,48.8}},
        color={128,0,255},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1[3].clock) annotation (Line(
        points={{-73,-84},{74,-84},{74,40},{60,40},{60,48.8}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics), experiment(StopTime=1.1));
  end TestSerialPackagerBitPack_UDP;

  model TestSerialPackager_SharedMemory
  extends Modelica.Icons.Example;
    ClockedBlocks.Packaging.SerialPackager.Packager packager
      annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
    ClockedBlocks.Packaging.SerialPackager.AddReal addReal(n=3, nu=1)
      annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
    ClockedBlocks.Packaging.SerialPackager.AddInteger addInteger(nu=1)
      annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
    ClockedBlocks.Communication.SharedMemoryWrite sharedMemoryWrite(
        autoBufferSize=true)                          annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,-50})));
    Modelica.Blocks.Sources.RealExpression realExpression[3](y=sin(time)*{1,2,3})
      annotation (Placement(transformation(extent={{-96,20},{-76,40}})));
    Modelica.Blocks.Sources.IntegerExpression integerExpression(y=integer(10*sin(
          time)))
      annotation (Placement(transformation(extent={{-96,-20},{-76,0}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.SampleClocked
                                                               sample1
      annotation (Placement(transformation(extent={{-66,-16},{-54,-4}})));
    Modelica_Synchronous.RealSignals.SampleAndHolds.SampleClocked
                                                            sample2[3]
      annotation (Placement(transformation(extent={{-66,24},{-54,36}})));
    Modelica_Synchronous.Clocks.PeriodicRealClock periodicRealClock(period=
          0.1)
      annotation (Placement(transformation(extent={{-94,-90},{-74,-70}})));
    ClockedBlocks.Packaging.SerialPackager.GetReal getReal(n=3, nu=1)
      annotation (Placement(transformation(extent={{30,30},{50,50}})));
    ClockedBlocks.Packaging.SerialPackager.GetInteger getInteger
      annotation (Placement(transformation(extent={{30,-10},{50,10}})));
    ClockedBlocks.Communication.SharedMemoryRead sharedMemoryRead(
        autoBufferSize=true)                        annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={40,80})));
    Modelica_Synchronous.RealSignals.SampleAndHolds.AssignClock  assignClock1[3]
      annotation (Placement(transformation(extent={{62,34},{74,46}})));
    Modelica_Synchronous.IntegerSignals.SamplerAndHolds.AssignClock
      assignClock2
      annotation (Placement(transformation(extent={{62,-6},{74,6}})));
  equation
    connect(packager.pkgOut, addReal.pkgIn) annotation (Line(
        points={{-30,59.2},{-30,40.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(addReal.pkgOut[1], addInteger.pkgIn) annotation (Line(
        points={{-30,19.2},{-30,0.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(addInteger.pkgOut[1], sharedMemoryWrite.pkgIn) annotation (Line(
        points={{-30,-20.8},{-30,-30},{-30,-39.2},{-30,-39.2}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(integerExpression.y,sample1. u) annotation (Line(
        points={{-75,-10},{-67.2,-10}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(sample1.y, addInteger.u[1]) annotation (Line(
        points={{-53.4,-10},{-42,-10}},
        color={255,127,0},
        smooth=Smooth.None));
    connect(periodicRealClock.y,sample1. clock) annotation (Line(
        points={{-73,-80},{-60,-80},{-60,-17.2}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(realExpression.y,sample2. u) annotation (Line(
        points={{-75,30},{-67.2,30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample2[1].clock) annotation (Line(
        points={{-73,-80},{-48,-80},{-48,12},{-60,12},{-60,22.8}},
        color={128,0,255},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample2[2].clock) annotation (Line(
        points={{-73,-80},{-48,-80},{-48,12},{-60,12},{-60,22.8}},
        color={128,0,255},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, sample2[3].clock) annotation (Line(
        points={{-73,-80},{-48,-80},{-48,12},{-60,12},{-60,22.8}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(sample2.y, addReal.u) annotation (Line(
        points={{-53.4,30},{-42,30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock2.clock) annotation (Line(
        points={{-73,-80},{68,-80},{68,-7.2}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1[1].clock) annotation (Line(
        points={{-73,-80},{88,-80},{88,18},{68,18},{68,32.8}},
        color={128,0,255},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1[2].clock) annotation (Line(
        points={{-73,-80},{88,-80},{88,18},{68,18},{68,32.8}},
        color={128,0,255},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1[3].clock) annotation (Line(
        points={{-73,-80},{88,-80},{88,18},{68,18},{68,32.8}},
        color={135,135,135},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(sharedMemoryRead.pkgOut, getReal.pkgIn) annotation (Line(
        points={{40,69.2},{40,50.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(getReal.pkgOut[1], getInteger.pkgIn) annotation (Line(
        points={{40,29.2},{40,10.8}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(getReal.y, assignClock1.u) annotation (Line(
        points={{51,40},{60.8,40}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(getInteger.y[1], assignClock2.u) annotation (Line(
        points={{51,0},{60.8,0}},
        color={255,127,0},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics), experiment(StopTime=1.1));
  end TestSerialPackager_SharedMemory;

  model TestInputSpaceMouse
    extends Modelica.Icons.Example;
    OperatingSystem.SynchronizeRealtime synchronizeRealtime
      annotation (Placement(transformation(extent={{-42,60},{-22,80}})));
    Modelica_Synchronous.Clocks.PeriodicRealClock periodicRealClock(period=
          0.1)
      annotation (Placement(transformation(extent={{-74,-18},{-54,2}})));
    InputDevices.SpaceMouseInput spaceMouseInput
      annotation (Placement(transformation(extent={{-78,18},{-58,38}})));
    Modelica_Synchronous.RealSignals.SampleAndHolds.AssignClock  assignClock1
      annotation (Placement(transformation(extent={{-36,28},{-24,40}})));
  equation

    connect(spaceMouseInput.axes[1], assignClock1.u) annotation (Line(
        points={{-57,33.1667},{-47.7,33.1667},{-47.7,34},{-37.2,34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1.clock) annotation (Line(
        points={{-53,-8},{-30,-8},{-30,26.8}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}),
                        graphics), experiment(StopTime=1.1));
  end TestInputSpaceMouse;

  model TestInputJoystick
    extends Modelica.Icons.Example;
    InputDevices.JoystickInput joystickInput
      annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
    OperatingSystem.SynchronizeRealtime synchronizeRealtime
      annotation (Placement(transformation(extent={{-42,60},{-22,80}})));
    Modelica_Synchronous.Clocks.PeriodicRealClock periodicRealClock(period=
          0.1)
      annotation (Placement(transformation(extent={{-74,-18},{-54,2}})));
    Modelica_Synchronous.RealSignals.SampleAndHolds.AssignClock  assignClock1
      annotation (Placement(transformation(extent={{-26,28},{-14,40}})));
  equation

    connect(assignClock1.u, joystickInput.pOV) annotation (Line(
        points={{-27.2,34},{-42,34},{-42,30},{-59,30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1.clock) annotation (Line(
        points={{-53,-8},{-20,-8},{-20,26.8}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}),
                        graphics), experiment(StopTime=1.1));
  end TestInputJoystick;

  model TestInputKeyboard
    extends Modelica.Icons.Example;
    OperatingSystem.SynchronizeRealtime synchronizeRealtime
      annotation (Placement(transformation(extent={{-42,60},{-22,80}})));
    Modelica_Synchronous.Clocks.PeriodicRealClock periodicRealClock(period=
          0.1)
      annotation (Placement(transformation(extent={{-74,-18},{-54,2}})));
    Modelica_Synchronous.BooleanSignals.SamplerAndHolds.AssignClock
      assignClock1
      annotation (Placement(transformation(extent={{-30,24},{-18,36}})));
    InputDevices.KeyboardInput keyboardInput
      annotation (Placement(transformation(extent={{-82,22},{-62,42}})));
  equation

    connect(periodicRealClock.y, assignClock1.clock) annotation (Line(
        points={{-53,-8},{-24,-8},{-24,22.8}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    connect(keyboardInput.keyUp, assignClock1.u) annotation (Line(
        points={{-61,38},{-48,38},{-48,30},{-31.2,30}},
        color={255,0,255},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}),
                        graphics), experiment(StopTime=1.1));
  end TestInputKeyboard;

  model TestInputKeyboardKey
    extends Modelica.Icons.Example;
    OperatingSystem.SynchronizeRealtime synchronizeRealtime
      annotation (Placement(transformation(extent={{-42,60},{-22,80}})));
    Modelica_Synchronous.Clocks.PeriodicRealClock periodicRealClock(period=
          0.1)
      annotation (Placement(transformation(extent={{-74,-18},{-54,2}})));
    Modelica_Synchronous.BooleanSignals.SamplerAndHolds.AssignClock
      assignClock1
      annotation (Placement(transformation(extent={{-30,24},{-18,36}})));
    InputDevices.KeyboardKeyInput keyboardKeyInput(keyCode="Space")
      annotation (Placement(transformation(extent={{-78,20},{-58,40}})));
  equation

    connect(keyboardKeyInput.keyState, assignClock1.u) annotation (Line(
        points={{-57,30},{-31.2,30}},
        color={255,0,255},
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1.clock) annotation (Line(
        points={{-53,-8},{-24,-8},{-24,22.8}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}),
                        graphics), experiment(StopTime=1.1));
  end TestInputKeyboardKey;

  model TestRandomRealSource
    extends Modelica.Icons.Example;
    Modelica_Synchronous.Clocks.PeriodicRealClock periodicRealClock(period=
          0.1)
      annotation (Placement(transformation(extent={{-66,-12},{-46,8}})));
    Modelica_Synchronous.RealSignals.SampleAndHolds.AssignClock  assignClock1
      annotation (Placement(transformation(extent={{-18,28},{-6,40}})));
    OperatingSystem.RandomRealSource randomRealSource
      annotation (Placement(transformation(extent={{-74,24},{-54,44}})));
    OperatingSystem.SynchronizeRealtime synchronizeRealtime
      annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  equation

    connect(randomRealSource.y[1], assignClock1.u) annotation (Line(
        points={{-53,34},{-19.2,34}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(periodicRealClock.y, assignClock1.clock) annotation (Line(
        points={{-45,-2},{-12,-2},{-12,26.8}},
        color={175,175,175},
        pattern=LinePattern.Dot,
        thickness=0.5,
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
              -100,-100},{100,100}}),
                        graphics), experiment(StopTime=1.1));
  end TestRandomRealSource;
end Examples;
