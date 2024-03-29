

rule minimap:
    input:
        unpack(input_from_df)
    output: 
        bam =  OUTPATH / "{sample}/aln.bam",
        idx = OUTPATH / "{sample}/aln.bam.csi",
    params:
        extra = config["minimap_sr"]["extra_params"],   
    conda:
        "envs/minimap.yaml"
    threads: 
        config["minimap_sr"]["threads"]        
    shell:
        "minimap2 -t {threads} -a -x sr {input.refgenome} {input.fq1} {input.fq2}  | "
        "samtools fixmate -u -m - - | "
        "samtools sort -u -@2  - | "
        "samtools markdup -O bam -@8 --reference {input.refgenome} - {output.bam}"
        " && "
        "samtools index -c {output.bam}"
