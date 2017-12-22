clear;

%%%-----------------------------------------------------------------------
%%% wrapper for META analysis
%%%
%addpath '/Volumes/Ray/META/'
   chdir('/media/biswal/Ray/META/');

 [err, mask, Info, ErrMessage] = BrikLoad('/media/Ray/META/cerebral_maxprob_mask_4mm.nii');


%%%%--------------- get coordinates from mask ----------------------------

dim=size(mask);

n=1;
  for x=1:dim(1)
      for y=1:dim(2) 
          for z=1:dim(3)
         
             if  mask(x,y,z) ==1
                 
        fprintf('++++  +++++++ running on the voxel   %d  \n',n);      
              
              coordinates(n,:)=[x,y,z];
                         name = sprintf('%05d',n);

              n=n+1; 
             end    
          end
      end 
  end

%%%----------------  get studies from each coordinates -----------------------
load features_v6.mat;
choose_study_pmid=features.pmid;

for i = [8,10,12]

rrr =i; 
mask_MNI='/media/biswal/Ray/META/MNI152_T1_3mm_brain_mask.nii';
output_folder=['/media/biswal/Ray/META/thalamus_whole/paper_list_Cere_3mm/',sprintf('%02d',i),'mm'];
Do_meta_get_study_from_voxel_coor_par(coordinates,rrr,mask_MNI,output_folder,[num2str(i),'mm_'],choose_study_pmid);

end

