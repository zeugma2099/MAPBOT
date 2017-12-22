clear;

%%%-----------------------------------------------------------------------
%%% wrapper for META analysis
%%%
%addpath '/Volumes/Ray/META/'
   chdir('/media/biswal/Ray/META/');

 [err, mask, Info, ErrMessage] = BrikLoad('/media/biswal/Ray/META/cerebral_maxprob_25_mask_3mm.nii');


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
  
%Do_meta_twoway_chi_square_v2(['/media/biswal/Ray/META/thalamus_whole/paper_list_L_3mm/selected_studies_',name,'.mat'],'/media/biswal/Ray/META/thalamus_whole/co_maps_L_3mm',['META_',name,'_'],[ ]);

              n=n+1; 
             end    
          end
      end 
  end

%%%----------------  get studies from each coordinates -----------------------
load features_v6.mat;
choose_study_pmid=features.pmid;

for i = [6,9,12]

rrr =i; 
mask_MNI='/media/biswal/Ray/META/MNI152_T1_3mm_brain_mask.nii';
output_folder=['/media/biswal/Ray/META/thalamus_whole/paper_list_Cere_3mm/',sprintf('%02d',i),'mm'];
%Do_meta_get_study_from_voxel_coor_par(coordinates,mask_MNI,output_folder,'_',choose_study_pmid);
Do_meta_get_study_from_voxel_coor_par(coordinates,rrr,mask_MNI,output_folder,[num2str(i),'mm_'],choose_study_pmid);
%Do_meta_get_study_from_voxel_coor_par(coordinates,radius,whole_brain_mask,output_dir,suffix,choose_pmid)
end

%Do_meta_get_study_from_voxel_coor_par(coordinates,'/media/biswal/Ray/META/cerebral_maxprob_25_mask_4mm.nii','/media/biswal/Ray/META/thalamus_whole/paper_list_Cere_4mm/','_');
