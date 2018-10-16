function c1= calusrcentroid(words,Cs)

disp('Are your headaches, Migraines?');
prompt='Duration of headaches(Very less(VLD)/Less(LD)/High(HD)/Feels like Eternity(ED))';
result1=input(prompt);
prompt='Unilateral Location (Never(NUL)/Sometimes(SUL)/Everytime(EUL))';
result2=input(prompt);
prompt='Pulsating Quality (Non Existent(NEPQ)/Sometimes(SPQ)/More Often Than Not(MOTNPQ)/Always(APQ))';
result3=input(prompt);
prompt='Pain Intensity (Low(LPI)/Moderate(MPI)/High(HPI)/Very High(VHI)/Stinging(SPI))';
result4=input(prompt);
prompt='Aggravation by/ or caused avoidance of routine physical activity (Never(NAPA)/Sometime(SAPA)/More often than not(MOTNAPA)/Always(AAPA))';
result5=input(prompt);
prompt='Nausea and/or vomiting (Never(NN)/Sometimes(SN)/More Often Than Not(MOTNN)/Always(AN))';
result6=input(prompt);
prompt='Photophobia (Non Existent(NEPH)/Very Low(VLPH)/High(HPH)/Always Very High(AVHPH))';
result7=input(prompt);
prompt='Phonophobia (Non existent(NEPN)/Very Low(VLPN)/High(HPN)/High (HPN)/ Always Very High(AVHPN))';
result8=input(prompt);



i=1;
while i<32
    if(strcmp(words(i),result1))
        break
    else
        i=i+1;
    end
end
y(1)=Cs(i);
i=1;
while i<32
    if(strcmp(words(i),result2))
        break
    else
        i=i+1;
    end
end
y(2)=Cs(i);
i=1;
while i<32
    if(strcmp(words(i),result3))
        break
    else
        i=i+1;
    end
end
y(3)=Cs(i);
i=1;
while i<32
    if(strcmp(words(i),result4))
        break
    else
        i=i+1;
    end
end
y(4)=Cs(i);

i=1;
while i<32
    if(strcmp(words(i),result5))
        break
    else
        i=i+1;
    end
end
y(5)=Cs(i);

i=1;
while i<32
    if(strcmp(words(i),result6))
        break
    else
        i=i+1;
    end
end
y(6)=Cs(i);

i=1;
while i<32
    if(strcmp(words(i),result7))
        break
    else
        i=i+1;
    end
end
y(7)=Cs(i);

i=1;
while i<32
    if(strcmp(words(i),result8))
        break
    else
        i=i+1;
    end
end
y(8)=Cs(i);




c1=(y(1)+y(2)+y(3)+y(4)+y(5)+y(6)+y(7)+y(8))/8;


%if (c1<4) 
 %   disp('Your Headaches are Migraines. Follow LIfestyle and trigger management along with medication');
%elseif (c1>4)
 %   disp('Traditional Headaches');
%end
